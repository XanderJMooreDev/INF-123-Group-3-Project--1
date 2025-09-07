if state == "Standing" {
	spriteToUse = standSprite;
	spriteFrame = 0;
}
if state == "Shooting" {
	spriteToUse = shootSprite;
	spriteFrame = 0;
}
else if state == "Falling" {
	spriteToUse = fallSprite;
	spriteFrame = 0;
}
else if state == "Jumping" {
	spriteToUse = jumpSprite;
	spriteFrame = 0;
}
else if state == "Walking" {
	spriteToUse = walkSprite;
	spriteFrame = floor(animationFrame) % sprite_get_number(walkSprite);
}
else if state == "Spinning" {
	 spriteToUse = spinSprite;
	spriteFrame = floor(timeSinceSpin * sprite_get_number(spinSprite));
}
	
draw_sprite_ext(
    spriteToUse,         // sprite
    spriteFrame,        // sub-image (frame)
    x + 32,                  // x position
    y + 32,                  // y position
    facingDir,             // xscale → mirrors when -1
    1,                  // yscale (no flip vertically)
    0,                  // rotation
    c_white,            // color tint
    1                   // alpha
);