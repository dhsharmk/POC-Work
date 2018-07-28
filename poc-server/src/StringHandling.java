public class StringHandling {
    public static void main(String[] args) {
        String s = "Atta 10 kilo 35 rupye Gehu 10 kilo 20 rupye";
        s = s.trim();
        s = s.replace("()+", " ");
        String[] sa = s.split(" ");

        if (sa.length % 5 == 0) {
            System.out.println("Done");
        } else {
            System.out.println("Not Done");
        }
    }

    private String convertStr(String inputString) {
        String temp = null;
        String str = inputString;

        // remove whitespaces before and after
        str = str.trim();

        // remove whitespaces from middle
        str = str.replace("( )+", " "); // Change multiple spaces to single space between words
        String[] strArray = str.split(" ");
        if (strArray.length % 5 == 0) {
            boolean c = true;
            for (int i = 0; i < strArray.length - 2; i = i + 5) {
                try {
                    int num = Integer.parseInt(strArray[i]);
                } catch (NumberFormatException ex) {
                    c = false;
                } finally {
                    if (c) {
                        temp = strArray[i + 2];
                        strArray[i + 2] = strArray[i + 1];
                        strArray[i + 1] = strArray[i];
                        strArray[i] = temp;
                    }
                }
                c = true;
            }
            str = String.join(" ", strArray);
        }
        return str;
    }
}