public with sharing class AccountValidationHandler {
    public static void preventDeleteActiveAccounts(List<Account> accList) {
        for (Account acc : accList) {
            // สมมติว่าใช้ฟิลด์ Rating เป็นตัวบอกสถานะ (ถ้าเป็น Hot ห้ามลบ)
            if (acc.Rating == 'Hot') {
                acc.addError('ไม่สามารถลบ Account นี้ได้ เนื่องจากเป็นลูกค้าระดับ Hot!');
            } else if (acc.Rating == 'Warm') {
                acc.addError('ไม่สามารถลบ Account นี้ได้ เนื่องจากเป็นลูกค้าระดับ Warm!');
            }
        }
    }
}