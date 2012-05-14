

void selectDirectory() {

    String folderPath = selectFolder();  // Opens file chooser
    if (folderPath == null) {
        // If a folder was not selected
        println("No folder was selected...");
    } 
    else {
        // If a folder was selected, print path to folder
        println(folderPath);
    }
}

String selectFile() {

    String loadPath = selectInput();  // Opens file chooser
    if (loadPath == null) {
        // If a file was not selected   

        return "-";
    } 
    else {
        // If a file was selected, print path to file
        if (loadPath.equals('\0')) {
            loadPath = "-";
        }
        return loadPath;
    }
}



int[] loadRawBytes(String file) {

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




void selectAndLoadRawBytes() {

    String loadFilename = selectFile();

    if (loadFilename.equals("-")) {
    }
    else {
        data = loadRawBytes(loadFilename);
        startByte = 0;
    }
}


