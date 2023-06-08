const draw = (ctx, tilePoint, noFill, lineWidth) => {
    const length = tilePoint[2];
    const height = tilePoint[2] * (Math.sqrt(3)/2);
    ctx.moveTo(tilePoint[0], tilePoint[1] - height/2);
    ctx.lineTo(tilePoint[0] -length / 2, tilePoint[1] + height/2);
    ctx.lineTo(tilePoint[0] + length / 2, tilePoint[1] + height/2);
    ctx.lineTo(tilePoint[0], tilePoint[1]-height/2);

    if (!noFill) {
        ctx.fill();
    }
}

export { draw };