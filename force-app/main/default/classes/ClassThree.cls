public class ClassThree {
    public static String getPriority(Integer level) {
        if (level > 90) return 'Critical';
        else if (level > 70) return 'High';
        else if (level > 50) return 'Medium';
        else return 'Low';
    }
}