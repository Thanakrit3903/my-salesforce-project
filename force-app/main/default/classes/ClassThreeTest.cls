@isTest
private class ClassThreeTest {
    @isTest static void testFullCoverage() {
        // ตรวจสอบตัวสะกด ClassThree ตรงนี้ให้ตรงกับชื่อไฟล์เป๊ะๆ
        String res1 = ClassThree.getPriority(100); 
        String res2 = ClassThree.getPriority(80);
        String res3 = ClassThree.getPriority(60);
        String res4 = ClassThree.getPriority(10);
        
        Assert.areEqual('Critical', res1);
    }
}