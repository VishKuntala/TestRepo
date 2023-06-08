const draw = (ctx, tilePoint, noFill) => {
    
    ctx.arc(tilePoint[0], tilePoint[1], tilePoint[2], 0, Math.PI * 2, false);
    ctx.arc(tilePoint[0], tilePoint[1], tilePoint[2] * .35, 0, Math.PI * 2, true);

    if (!noFill) {
        ctx.fill();
    }
}

export { draw };