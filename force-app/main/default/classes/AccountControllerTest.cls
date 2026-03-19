@isTest
private class AccountControllerTest {

    @isTest
    static void testGetAccounts() {
        // 1. Prepare Data
        List<Account> testAccs = new List<Account>();
        for(Integer i=0; i<5; i++) {
            testAccs.add(new Account(Name = 'Test Account ' + i, Industry = 'Technology'));
        }
        insert testAccs;

        // 2. Test Execution
        Test.startTest();
        List<Account> result = AccountController.getAccounts();
        Test.stopTest();

        // 3. Verification
        // ใช้ Assert.areNotEqual และ Assert.areEqual (แบบไม่มี s และไม่มีคำว่า System นำหน้า)
        Assert.areNotEqual(0, result.size(), 'ควรจะมีข้อมูล Account ส่งกลับมา');
        Assert.areEqual(5, result.size(), 'จำนวน Account ควรเท่ากับที่สร้างไว้');
        Assert.areEqual('Test Account 0', result[0].Name, 'ชื่อ Account ตัวแรกไม่ถูกต้อง');
    }
}