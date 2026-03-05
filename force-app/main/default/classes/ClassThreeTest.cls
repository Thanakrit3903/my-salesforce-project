@isTest
private class ClassThreeTest {
    @isTest static void testLowCoverage() {
        // ส่งแค่ 100 เพื่อให้รันแค่บรรทัด "if (level > 90)"
        // บรรทัด else if และ else ตัวอื่นๆ จะเป็นสีแดง (Uncovered)
        String result = ClassThree.getPriority(100);
        Assert.areEqual('Critical', result);
    }
    // ถ้าจะให้ครอบคลุมทุกกิ่ง ต้องเขียนเทสเพิ่มอีก 3 กิ่ง (Branches) ดังนี้
}