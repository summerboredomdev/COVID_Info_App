using CovidInfoAPI.Models;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CovidInfoAPI.Services
{
    public class SymptomsRetrieveService
    {
        public List<Symptom> GetSymptoms()
        {
            Symptom cough = new("Dry cough", "Continuous dry cough for longer than 24 hours");
            Symptom taste = new("Lost sense of smell/taste", "Cannot smell or taste properly");
            Symptom fever = new("Fever", "Continuous body temperature over 37 degrees Celcius");
            Symptom tired = new("Feeling tired", "Feeling very tired ");
            Symptom soreThroat = new("Sore throat", "Sore throat for a continuous period of time");

            List<Symptom> symptoms = new();
            symptoms.Add(cough);
            symptoms.Add(taste);
            symptoms.Add(fever);
            symptoms.Add(tired);
            symptoms.Add(soreThroat);

            return symptoms;
        }
    }
}
