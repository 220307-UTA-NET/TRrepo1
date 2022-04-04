using System;
using System.IO;

namespace Store
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("Hello and welcome to Tuck's Sword and Motorcycle Emporium Order Management Tool.\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            while (true)
            {
                Console.WriteLine("                     Are you a customer or store employee?\n(please indicate with a 'c' for customer or an 'e' for store employee, 'x' to exit)");
                int? theCase = 0;
                string[] littleArray = { "e", "x", "c" };
                string? userInp = Console.ReadLine();
                if (userInp == null)
                {
                    Console.WriteLine("No input detected, try again.");
                }
                else if (userInp == "c")
                {
                    theCase = 2;
                }
                else if (userInp == "e")
                {
                    theCase = 1;
                }
                else if (userInp == "x")
                {
                    theCase = 0;
                }
                else if (littleArray.Contains(userInp) == false)
                {
                    Console.WriteLine("Invalid input: please input one of the accepted characters.");
                }
                switch (theCase)
                {
                    case 2:
                        Console.Clear();
                        Console.WriteLine("Customer option");
                        Console.WriteLine("What would you like to do?\nYour options are:\n1) Place an order.\n2) Check order history\n3) Add a new user / sign up.\n4) Find an existing user account.");
                        int? newCase = int.TryParse(Console.ReadLine());
                        if (newCase == 4)
                        {

                        }
                        else if (newCase == 3)
                        {

                        }
                        else if (newCase == 2)
                        {

                        }
                        else if (newCase == 1)
                        {

                        }
                        else
                        {
                            Console.WriteLine("Bad input,")
                        }
                        break;
                    case 1:
                        Console.Clear();
                        Console.WriteLine("Employee option");
                        Console.WriteLine("What would you like to do?\nYour options are:\n1) Place an order.\n2) Check order history\n3) Add a new user / sign up.\n4) Find an existing user account.");
                        break;
                    case 0:
                        Console.Clear();
                        Console.WriteLine("Terminating function.");
                        Console.ReadKey();
                        return;
                }
            }
        }
    }
}