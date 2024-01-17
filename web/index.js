import { join } from 'path';
import { readFileSync } from 'fs';
import express from 'express';
import serveStatic from 'serve-static';

import shopify from './shopify.js';
import webhooks from './webhooks.js';

const PORT = parseInt(process.env.BACKEND_PORT || process.env.PORT, 10);

const STATIC_PATH =
    process.env.NODE_ENV === 'production'
        ? `${process.cwd()}/frontend/dist`
        : `${process.cwd()}/frontend/`;

const app = express();

// Set up Shopify authentication and webhook handling
app.get(shopify.config.auth.path, shopify.auth.begin());
app.get(
    shopify.config.auth.callbackPath,
    shopify.auth.callback(),
    shopify.redirectToShopifyOrAppRoot()
);
app.post(
    shopify.config.webhooks.path,
    // @ts-ignore
    shopify.processWebhooks({ webhookHandlers: webhooks })
);

// All endpoints after this point will require an active session
app.use('/api/*', shopify.validateAuthenticatedSession());

app.use(express.json());

app.use(serveStatic(STATIC_PATH, { index: false }));

app.use('/*', shopify.ensureInstalledOnShop(), async (_req, res) => {
    return res.set('Content-Type', 'text/html').send(readFileSync(join(STATIC_PATH, 'index.html')));
});

app.post('/api/save-cart', async (req, res) => {
    try {
      // Retrieve data from the request body (e.g., checkout token and product ids)
      const { checkoutToken, productIds } = req.body;
  
      // Save the data to your database using Prisma
      const savedCart = await prisma.savedCart.create({
        data: {
          checkoutToken,
          productIds,
        },
      });
  
      console.log('Cart data saved:', savedCart);
  
      res.status(200).json({ success: true });
    } catch (error) {
      console.error('Error saving cart data:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });

app.listen(PORT);
