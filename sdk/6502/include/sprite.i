* Here are the sprite control block offsets
* The final offset, SCB_SIZEOF, contains the byte-size of the structure
* Note that the palette will move up if any of HSIZE, VSIZE, STRETCH, or TILT
* are not used
SCB_CTRL0	.EQ 0
SCB_CTRL1	.EQ {SCB_CTRL0+1}
SCB_CTRL2	.EQ {SCB_CTRL1+1}
SCB_NEXT	.EQ {SCB_CTRL2+1}
SCB_DATA	.EQ {SCB_NEXT+2}
SCB_HPOS	.EQ {SCB_DATA+2}
SCB_VPOS	.EQ {SCB_HPOS+2}
SCB_HSIZE	.EQ {SCB_VPOS+2}
SCB_VSIZE	.EQ {SCB_HSIZE+2}
SCB_STRETCH	.EQ {SCB_VSIZE+2}
SCB_TILT	.EQ {SCB_STRETCH+2}
SCB_PALETTE	.EQ {SCB_TILT+2}

SCB_SIZEOF	.EQ {SCB_PALETTE+8}


