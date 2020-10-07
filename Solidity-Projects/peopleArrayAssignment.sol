/* People Array Assignment

Your assignment for today is to make a copy of the Helloworld contract and make a few changes. Make sure to keep your original People contract as well, since we will continue to work on that tomorrow.

Instead of having a mapping where we store people, create a new array where we can store the people. 
When someone creates a new person, add the Person object to the people array instead of the mapping.
Create a public get function where we can input an index and retrieve the Person object with that index in the array.
Modify the Person struct and  add an address property Creator. Make sure to edit the createPerson function so that it sets this property to the msg.sender.

Bonus Assignment#1

-Create a new mapping (address to uint) which stores the number of people created by a specific address.
-Modify the createPerson function to set/update this mapping for every new person created.

Bonus Assignment #2 [Difficult]

- Create a function that returns an array of all the ID's that the msg.sender has created.

Turn in this assignment as a link to your code in GitHub. */

pragma solidity 0.5.12;

contract part1{
// state vars
struct Person{
  string name;
  uint age;
  uint height;
  bool senior;
  address creator;
}

Person[] private people;

function CreatePerson(string memory name, uint age, uint height) public  {
  
  Person memory newPerson;
   newPerson.creator = msg.sender;
   newPerson.age >= 65 ? newPerson.senior = true : newPerson.senior = false;



  people.push(Person(name, age, height, newPerson.senior, newPerson.creator));
}

function GetPerson(uint index) public view returns(string memory name, uint age, uint height, bool senior, address creator){
  
  return (people[index].name, people[index].age, people[index].height, people[index].senior, people[index].creator);
}
}

contract BONUS1{
// state vars
struct Person{
  string name;
  uint age;
  uint height;
  bool senior;
  address creator;
}

Person[] private people;
mapping(address => uint) private Commits;

function CreatePerson(string memory name, uint age, uint height) public  {
  
  Person memory newPerson;
   newPerson.creator = msg.sender;
   newPerson.age >= 65 ? newPerson.senior = true : newPerson.senior = false;


  Commits[newPerson.creator] = Commits[newPerson.creator] + 1;
  people.push(Person(name, age, height, newPerson.senior, newPerson.creator));
  
}

function GetPerson(uint index) public view returns(string memory name, uint age, uint height, bool senior, address creator){
  
  return (people[index].name, people[index].age, people[index].height, people[index].senior, people[index].creator);
}

function GetCommits() public view returns(uint commits){
return  Commits[msg.sender];
}


}


/*  BONUS2 Failed I do not know how to push to an array thats only in memory so i get this error

*****    Member "push" is not available in uint256[] memory outside of storage. *******

*** This Was my LOW Knoledge attempt to make the function

*/


/*

function UserArrayIDs() public view returns(uint[] memory){

uint[] memory ar;

for(uint a = 0; a < people.length; a++){
  address userCheck = msg.sender;
  if(userCheck == people[a].creator){
    ar.push(a);
  }
}

return (ar);

}

}

*/