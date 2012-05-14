
int[] romContents1;
int[] romContents2;

color BLACK = color(0);
color WHITE = color(255);
color GREEN = color(0, 200, 0);
color YELLOW = color(#F6FA1C);
color RED = color(255, 0, 0);

boolean loadFile;

int startByte = 0;

void setup() {

    size(1024, 512);
    initFonts();

    //selectAndLoadNES();
    romContents1 = loadRawBytes("Excbike.nes");
    loadFile = false;

}


void draw() {

    background(127);

    if (loadFile) {
        selectAndLoadNES();
        loadFile = false;
    }


    displayDump(romContents1, startByte, 0, 0, 20);

    displayFASTA_sequence(romContents1, startByte, width-250, 225, 100);
    
    printHex(romContents1, startByte, startByte+32, 20, 200);

    /// startByte
    displayBlock(romContents1, startByte, 250, 225, 15, GREEN, WHITE);

    /// nextByte
    displayBlock(romContents1, startByte+8, 250+120+15, 225, 15, BLACK, WHITE);

    /// mixed
    displaySprite(romContents1, startByte, 250+60, 225+120+15, 15, WHITE, BLACK, RED, GREEN);

    /// display ASCII
    displayText(romContents1, startByte, startByte+512, 250+240+30+20, 225);

}

