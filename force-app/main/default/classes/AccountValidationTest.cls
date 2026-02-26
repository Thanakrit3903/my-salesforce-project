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
        // 1. สร้าง Account ที่เป็น Warm
        Account acc = new Account(Name = 'Warm Account', Rating = 'Warm');
        insert acc;

        // 2. ลองลบ และดักจับ Error
        Test.startTest();
        try {
            delete acc;
            Assert.fail('ควรจะพังที่บรรทัดนี้ เพราะห้ามลบ Warm account');
        } catch (DmlException e) {
            // 3. ตรวจตรวจสอบว่า Error Message ตรงกับที่เราเขียนไว้ไหม
            Assert.isTrue(e.getMessage().contains('ไม่สามารถลบ Account นี้ได้'), 'Message ไม่ตรง');
        }
        Test.stopTest();
    }
}