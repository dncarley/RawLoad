
void printHex(int[] romContents, int startByte, int endByte) {

    for (int i = startByte; i < endByte; i++) {

        println(hex(i)+"\t:\t"+hex(romContents[i]));
    }
}


void printHex(int[] romContents, int startByte, int endByte, int posX, int posY) {

    int x;
    int y;

    x = posX;
    y = posY;

    textFont(consoleFont, 13);

    if (startByte < romContents.length) {
        if (endByte > romContents.length) {
            endByte = romContents.length;
        }


        for (int i = startByte; i < endByte; i++) {

            if ( i == startByte) {
                fill(GREEN);
            }
            else {
                fill(BLACK);
            }

            String lineContents  = hex(i)+"\t:\t"+hex(romContents[i]) + "\t:\t" + nf(romContents[i], 3) + "\t:\t" + OP_6502[romContents[i]];// + "\t:\t" + char(romContents1[startByte]);
            text(lineContents, x, y);
            y += 14;
        }
    }
}


void displayDump(int[] romContents, int startByte, int xOffset, int yOffset, int maxRows) {

    int rowNum = yOffset;
    int colNum = xOffset;
    int colOffset = 0;

    for (int i = startByte; i < romContents.length; i++) {

        color onColor;
        color offColor;

        if ( i >= startByte && i < startByte + 8 ) {
            onColor = GREEN;
            offColor = BLACK;
        }
        else {
            onColor = BLACK;
            offColor = WHITE;
        }

        colNum = 0;
        for (int bit = 7; bit >=0; bit--) {

            int bitSet = (romContents[i] >> bit)&1;

            if (bitSet == 1) {
                set(colNum+colOffset, rowNum, onColor);
            }
            else {
                set(colNum+colOffset, rowNum, offColor);
            }
            colNum++;
        }
        rowNum++;
        if (rowNum-yOffset >= maxRows*8) {
            rowNum = yOffset;
            colOffset += 8;
        }
    }
}



void displayBlock(int[] romContents, int startByte, int posX, int posY, int scale, color onColor, color offColor) {

    int x; 
    int y;

    x = posX;
    y = posY;

    if (startByte+8 <= romContents.length) {
        for (int i = startByte; i < startByte+8; i++) {
            
            

            for (int bit = 7; bit >=0; bit--) {

                int bitSet = (romContents[i] >> bit)&1;

                if (bitSet == 1) {
                    fill(onColor);
                    //stroke(onColor);
                    rect(x, y, scale, scale);
                }
                else {
                    fill(offColor); 
                    //stroke(offColor);               
                    rect(x, y, scale, scale);
                }
                x+= scale;
            }
            x = posX;
            y+= scale;
        }
    }
}



void displaySprite(int[] romContents, int startByte, int posX, int posY, int scale, color c0, color c1, color c2, color c3) {

    color  m;
    int x;
    int y;

    x = posX;
    y = posY;

    if (startByte+16 <= romContents.length) {

        for (int i = startByte; i < startByte+8; i++) {

            for (int bit = 7; bit >=0; bit--) {

                int bitSet1 = (romContents[i] >> bit)&1;
                int bitSet2 = (romContents[i+8] >> bit)&1;

                if (bitSet1 == 0 && bitSet2 == 0) {
                    m = c0;
                }
                else if (bitSet1 == 1 && bitSet2 == 0) {
                    m = c1;
                }
                else if (bitSet1 == 0 && bitSet2 == 1) {
                    m = c2;
                }
                else if (bitSet1 == 1 && bitSet2 == 1) {
                    m = c3;
                }
                else {
                    m = c0;
                }
                fill(m);
                rect(x, y, scale, scale);

                x+= scale;
            }
            x = posX;
            y+= scale;
        }
    }
}


void displayText(int[] romContents, int startByte, int endByte, int posX, int posY) {


    String content = "";

    if (startByte < romContents.length) {

        if (endByte > romContents.length) {
            endByte = romContents.length;
        }

        for (int i = startByte; i < endByte; i++) {

            content += char(romContents[i]);
        }
    }

    fill(BLACK);

    text(content, posX, posY, 200, 200);
}

