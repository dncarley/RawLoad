

void keyPressed() {

    if (key == CODED) {
        if (keyCode == UP) {
            startByte -= 8;
            if (startByte < 0) {
                startByte = 0;
            }
        } 
        else if (keyCode == DOWN) {
            startByte += 8;
            if (startByte > romContents1.length) {
                startByte = romContents1.length;
            }
        }
        else if (keyCode == LEFT) {
            startByte -= 1024;
            if (startByte < 0) {
                startByte = 0;
            }
        } 
        else if (keyCode == RIGHT) {
            startByte += 1024;
            if (startByte > romContents1.length) {
                startByte = romContents1.length;
            }
        }
    }
    else {
        if (key == 's' || key == 'S') {
            startByte = 0;
        }
        else if (key == 'e' || key == 'E') {
            startByte = romContents1.length;
        }
        else if (key == 'j' || key == 'J') {
            startByte -= 1;
            if (startByte < 0) {
                startByte = 0;
            }
        }     
        else if (key == 'k' || key == 'K') {
            startByte += 1;
            if (startByte > romContents1.length) {
                startByte = romContents1.length;
            }
        }

        else if (key == '1') {
            startByte = 0;
        }        
        else if (key == '2') {
        }        
        else if (key == '3') {
        }        
        else if (key == '4') {
        }        
        else if (key == '5') {
        }        
        else if (key == '6') {
        }
        else if (key == '7') {
        }        
        else if (key == '8') {
        }        
        else if (key == '9') {
        }        
        else if (key == '0') {
            startByte = romContents1.length;
        }
    }
}

