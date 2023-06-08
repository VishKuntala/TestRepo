const draw = (ctx, tilePoint, noFill, lineWidth) => {
    const centerX = tilePoint[0];
    const centerY = tilePoint[1];
    const length = tilePoint[2];
    const height = tilePoint[2];
    const topLeftX = centerX - length / 2;
    const topLeftY = centerY - length / 2;
    if (lineWidth !== 0) {
        ctx.strokeRect(topLeftX, topLeftY, length, height);
    }
    if (!noFill) {
        ctx.fillRect(topLeftX, topLeftY, length, height);
    }
}
export { draw };