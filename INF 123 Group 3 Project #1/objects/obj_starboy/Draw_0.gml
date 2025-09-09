if state == "Standing" {
	spriteToUse = standSprite;
	spriteFrame = floor(animationFrame) % sprite_get_number(walkSprite);
}
if state == "Shooting" {
	spriteToUse = shootSprite;
	spriteFrame = floor(animationFrame) % sprite_get_number(walkSprite);
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
    x + 16,                  // x position
    y,                  // y position
    facingDir * (1/8),             // xscale → mirrors when -1
    1/8,                  // yscale (no flip vertically)
    0,                  // rotation
    c_white,            // color tint
    1                   // alpha
);