@RestResource(urlMapping='/AccountInfo/*')
global class MyApexCall
{
    global class AccountInfo
    {
        String AccountId{get;set;}
        String AccountName{get;set;}
        String AccountType{get;set;}
    }
  
    @httpGet
    global static AccountInfo getStudent()
    {
        RestRequest request=RestContext.Request;
        String accountId= request.requestURI.substring(request.RequestURI.lastIndexOf('/')+1);
        Account account=[select id,Name,type from Account where id=:accountId];
        AccountInfo aInfo=new AccountInfo();
        aInfo.AccountId=account.Id;
        aInfo.AccountName=account.Name;
        aInfo.AccountType=account.Type;
             
        return aInfo;
    }
}
