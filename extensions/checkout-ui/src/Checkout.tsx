import { useState, useEffect } from 'react';
import { Banner, Checkbox, useApi, reactExtension } from '@shopify/ui-extensions-react/checkout';
import { getCartData } from './Services/ProductService';

export default reactExtension('purchase.checkout.block.render', () => <Extension />);

function Extension() {
    const [accessToken, setAccessToken] = useState<string | null>(null);
    const [cartProducts, setCartProducts] = useState<string[]>([]);
    const api = useApi();
    const checkoutToken = api.checkoutToken;
    
    useEffect(() => {
        const unsubscribe = checkoutToken.subscribe((currentValue: string | null) => {
            if (typeof currentValue === 'string' || currentValue === null) {
                setAccessToken(currentValue);
                console.log("checkoutToken is a string: ", checkoutToken);

                const fetchCartData = async () => {
                    const products = await getCartData(currentValue);
                    setCartProducts(products);
                };

                fetchCartData();
            }
        });

        return () => {
            unsubscribe();
        };
    }, [checkoutToken]);

    return (
        <>
            <Banner title="Save your cart">
                <Checkbox>
                    {cartProducts.map(productId => (
                        <div key={productId}>{productId}</div>
                    ))}
                </Checkbox>
            </Banner>
        </>
    );
}
