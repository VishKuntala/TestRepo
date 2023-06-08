const draw = (ctx, tilePoint, noFill, lineWidth) => {
    ctx.arc(tilePoint[0], tilePoint[1], tilePoint[2], 0, Math.PI * 2, false);
    ctx.arc(tilePoint[0], tilePoint[1], tilePoint[2]*.60, 0, Math.PI * 2, true);

    if (!noFill) {
        ctx.fill();
    }
}

export { draw };