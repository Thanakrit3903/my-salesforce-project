@isTest
private class AccountValidationTest {
    
    @isTest
    static void testDeleteHotAccountFail() {
        // 1. สร้าง Account ที่เป็น Hot
        Account acc = new Account(Name = 'Hot Account', Rating = 'Hot');
        insert acc;

        // 2. ลองลบ และดักจับ Error
        Test.startTest();
        try {
            delete acc;
            Assert.fail('ควรจะพังที่บรรทัดนี้ เพราะห้ามลบ Hot account');
        } catch (DmlException e) {
            // 3. ตรวจตรวจสอบว่า Error Message ตรงกับที่เราเขียนไว้ไหม
            Assert.isTrue(e.getMessage().contains('ไม่สามารถลบ Account นี้ได้'), 'Message ไม่ตรง');
        }
        Test.stopTest();
    }

    @isTest
    static void testDeleteWarmAccountFail() {
        Account acc = new Account(Name = 'Warm Account', Rating = 'Warm');
        insert acc;

        // --- เพิ่มส่วนนี้เพื่อ Debug ---
        Account checkAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        System.debug('Current Rating before delete: ' + checkAcc.Rating);
        // ----------------------------

        Test.startTest();
        try {
            delete acc;
            Assert.fail('ควรจะพังที่บรรทัดนี้ เพราะ Rating คือ: ' + checkAcc.Rating);
        } catch (DmlException e) {
            Assert.isTrue(e.getMessage().contains('ไม่สามารถลบ Account นี้ได้'), 'Message ไม่ตรง: ' + e.getMessage());
        }
        Test.stopTest();
    }
}