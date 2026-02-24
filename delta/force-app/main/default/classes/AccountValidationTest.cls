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
    static void testDeleteColdAccountSuccess() {
        // เทสกรณีปกติ: ถ้าเป็น Cold ต้องลบได้
        Account acc = new Account(Name = 'Cold Account', Rating = 'Cold');
        insert acc;

        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();

        // ตรวจสอบว่าสำเร็จ
        Assert.isTrue(result.isSuccess(), 'ควรจะลบได้สำเร็จ');
    }
}