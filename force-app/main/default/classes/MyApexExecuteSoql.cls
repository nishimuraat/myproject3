public with sharing class MyApexExecuteSoql {

    public void MyExecuteQuery()
    {
        List<Account> acc = ExecuteQueryLocator();
        system.debug(acc);
    }

    public List<Account> ExecuteQueryLocator()
    {
        String query='select id,name,AccountNumber,Type from account';
        Database.QueryLocator iterator = Database.getQueryLocator(query);

        List<Account> listAcc = new List<Account>();
        for(Account acc : Database.Query(query))
        {
            listAcc.add(acc);
        }

        return listAcc;
    }
}
