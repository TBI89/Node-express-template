import AppConfig from "../AppConfig";

const appConfig = AppConfig.getInstance();

export const getCartData = async (accessToken: string | null): Promise<string[]> => {
  try {
    const response = await fetch(`${appConfig.getBaseUrl()}/admin/api/${appConfig.getApiVersion()}/products.json`, {
      method: 'POST', 
      headers: {
        'Content-Type': 'application/json',
        'X-Shopify-Access-Token': accessToken || '', 
      },
    });

    if (response.ok) {
      const data = await response.json();
      return data.productIds;
    } else {
      console.error('Failed to fetch cart data');
      return [];
    }
  } catch (error) {
    console.error('Error fetching cart data:', error);
    return [];
  }
};
