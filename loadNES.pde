


int[] loadNES(String file) {

    // open a file and read its binary data 
    byte b[] = loadBytes(file); 
    int r [] = new int[b.length];

    // print each value, from 0 to 255 
    for (int i = 0; i < b.length; i++) { 

        r[i] = b[i] & 0xff;
        //        print(char(r[i]));
    }
    return r;
}


void selectAndLoadNES() {

    String loadFilename = selectFile();

    if (loadFilename.equals("-")) {
    }
    else {
        data = loadNES(loadFilename);
        startByte = 0;
    }
}




