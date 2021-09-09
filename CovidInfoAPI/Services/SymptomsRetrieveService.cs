using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CovidInfoAPI.Services
{
    public class SymptomsRetrieveService
    {
        public string GetSymptoms()
        {
            var pageURL = "https://api.nhs.uk/conditions/coronavirus-covid-19?url=covidhackatonapi.azurewebsites.net/api/Symptoms&modules=false";

            var client = new RestClient(pageURL);
            var request = new RestRequest();
            request.Method = Method.GET;
            request.AddHeader("Accept", "application/json");
            IRestResponse response = client.Execute(request);
            var content = response.Content;
            return content;
        }
    }
}
