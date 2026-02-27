public with sharing class AccountService {
    // Method สำหรับเปลี่ยน Rating เป็น Hot
    public static void setRatingToHot(List<Account> accs) {
        for (Account acc : accs) {
            if (acc.Industry == 'Technology') {
                acc.Rating = 'Hot';
            } else if (acc.Industry == 'Banking') {
                acc.Rating = 'Cold';
            } else if (acc.Industry == 'Chemicals') {
                acc.Rating = 'Warm';
            }
        }
    }
}