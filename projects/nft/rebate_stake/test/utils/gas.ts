const PRICE_ETH = 300;

export const gasToETH = (gas: number, gwei: number = 5) => {
  const num = gas * gwei * 10 ** -9;
  return num.toFixed(4);
};

export const gasToUSD = (gas: number, gwei: number = 5, priceETH: number = PRICE_ETH) => {
  const num = gas * priceETH * gwei * 10 ** -9;
  return num.toFixed(2);
};
