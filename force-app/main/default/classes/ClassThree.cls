public class ClassThree {
    public static String getPriority(Integer level) {
        // มี 4 กิ่ง (Branches) ถ้าเทสแค่กิ่งเดียว Coverage จะได้แค่ ~25-30%
        if (level > 90) {
            return 'Critical';
        } else if (level > 70) {
            return 'High';
        } else if (level > 50) {
            return 'Medium';
        } else {
            return 'Low';
        }
    }
}