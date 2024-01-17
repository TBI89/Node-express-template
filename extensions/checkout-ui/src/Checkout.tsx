import {
    Banner,
    useApi,
    reactExtension,
    Checkbox,
} from '@shopify/ui-extensions-react/checkout';

export default reactExtension(
    'purchase.checkout.block.render',
    () => <Extension />,
);

function Extension() {

    return (
        <Banner title="Save your cart">

            <Checkbox >
                product
            </Checkbox>
        </Banner>
    );
}