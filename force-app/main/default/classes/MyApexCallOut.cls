public class MyApexCallOut
{
    public static Map<String,Object> getCalloutResponseContents()
    {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://data.fixer.io/api/latest?access_key=80b4541e0a9cb973c18ddc6dbfee9897');
        req.setMethod('GET');
        HttpResponse res=h.send(req);
        System.debug('response-->: '+res.getBody());
        Map<String,object> resultsMap=  (Map<String,object>)JSON.deserializeUntyped(res.getBody());
        System.debug('resultsMap '+resultsMap);
        return resultsMap;
    }
}