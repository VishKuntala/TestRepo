const draw = (ctx, tilePoint, noFill, lineWidth) => {
    const centerX = tilePoint[0];
    const centerY = tilePoint[1];
    const length = tilePoint[2];
    const height = tilePoint[2];
    const topLeftX = centerX - length;
    const topLeftY = centerY - length;
    if (lineWidth !== 0) {
        ctx.strokeRect(topLeftX, topLeftY, length*2, height*2);
    }
    if (!noFill) {
        ctx.fillRect(topLeftX, topLeftY, length*2, height*2);
    }
}
export { draw };