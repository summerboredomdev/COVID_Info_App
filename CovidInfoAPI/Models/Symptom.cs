﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CovidInfoAPI.Models
{
    public class Symptom
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public Symptom(string name, string description)
        {
            Name = name;
            Description = description;
        }
    }
}
