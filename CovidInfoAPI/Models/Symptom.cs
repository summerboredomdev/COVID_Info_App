using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CovidInfoAPI.Models
{
    public class Symptom
    {
        public string name;
        public string description;

        public Symptom(string name, string description)
        {
            this.name = name;
            this.description = description;
        }
    }
}
