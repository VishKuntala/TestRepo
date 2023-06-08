const draw = (ctx, tilePoint, noFill) => {
    ctx.arc(tilePoint[0], tilePoint[1], tilePoint[2], 0, Math.PI * 2);
}

export { draw };