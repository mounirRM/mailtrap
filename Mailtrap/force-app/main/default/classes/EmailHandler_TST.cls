@isTest
public class EmailHandler_TST {
 	@isTest
    static void getUsrDisplayNametest() {
        String res ;
		Test.startTest();
        res = EmailHandler.getUserDisplayName();
        Test.stopTest();
		System.assertNotEquals(res , null);
    } 
    
	@isTest
    static void updateDisplayNametest() {
		Test.startTest();
        EmailHandler.updateDisplayName('test');
        Test.stopTest();
        User usrtest = [Select SenderName FROM User Where Id=:UserInfo.getUserId()];
		System.assertEquals(usrtest.SenderName , 'test');
    } 
}