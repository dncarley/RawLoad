
color NEUC_A = color(200, 0, 0);
color NEUC_T = color(155, 0, 0);
color NEUC_C = color(0, 200, 0);
color NEUC_G = color(0, 255, 0);


void loadFASTA() {
    
    
    
}



void displayFASTA_sequence(int[] rawData, int startByte, int xOffset, int yOffset, int dWidth) {

    int rowNum = yOffset;
    int colNum = xOffset;

    color selectColor;

    for (int i = startByte; i < rawData.length; i++) {

        switch(char(rawData[i])) {
        case 'A':
            selectColor = NEUC_A;
            break;
        case 'T':
            selectColor = NEUC_T;
            break;
        case 'C':
            selectColor = NEUC_C;
            break;
        case 'G':
            selectColor = NEUC_G;
            break;
        default:

            selectColor = BLACK;
            break;
        }


        if (selectColor != BLACK) {
            set(colNum, rowNum, selectColor);

            //            rect(colNum, rowNum, scale, scale);
            colNum++;

            if (colNum-xOffset >= dWidth) {
                colNum = xOffset;
                rowNum++;
            }
        }
    }
}

void displayFASTA_amino() {
    
    
    
    
    
    
}

