public with sharing class EmailHandler {
    @AuraEnabled(cacheable=true)
    public static String getUserDisplayName() {
        User currentUSER =  [Select Name,SenderName FROM User Where Id=:UserInfo.getUserId()];
        system.debug(currentUSER.SenderName);
        if(String.isBlank(currentUSER.SenderName)){
            return currentUSER.Name;
        }
        return currentUSER.SenderName;
        //return currentUSER.SenderName!=null && currentUSER.SenderName!=''?currentUSER.SenderName: currentUSER.Name;
    }

    @AuraEnabled
    public static void updateDisplayName(String futurdispname) {
        User currentUSER =  [Select SenderName FROM User Where Id=:UserInfo.getUserId()];
        currentUSER.SenderName = futurdispname;
        update currentUSER;
    }
}