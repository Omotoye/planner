# PDDL Planning Engines
* ENHSP (Classical Planning ,Numeric and Hybrid Planning (PDDL+))
* LPG (Numeric and Temporal Planning)
* Metric FF (Numeric Planning (~~durative-actions~~ **not working**))

## ENHSP
---
The enhsp binary can be found in the dist folder or you could simple download it from [ENHSP Website](https://sites.google.com/view/enhsp/). It is easier to download the binary so you dont have to worry about compiling the source. However, if you download the binary, you have to install the latest version of java to run it because the binary was compile with the latest version. Any version above Java SE 13 would work. Steps to install the java version on Ubunut 20.04 is shown below
```bash
sudo apt update
```
```bash
sudo apt upgrade
```
```bash
sudo apt install openjdk-14-jdk
```
To check the installed version
```bash
java -version
```
With this installed you should be able to run the **enhsp** executable
* To run the enhsp executable, make sure **enhsp.jar** has executable permission, you can do this with the command below
```bash
chmod +x enhsp2.jar
```
To learn how to use enhsp, you can consult this page [ENHSP Tutorial](https://sites.google.com/view/enhsp/home/how-to-use-it)


Two domain + problem files are in the **dist** folder to test to see if the executable is working well. To try those examples, use the codes below. 

This is for an example with events and process 
```bash
./enhsp2.jar -o domain.pddl -f instance_1_30.0_0.1_10.0.pddl -planner sat-aibr
```

This is for an example of a classical planning problem 
```bash
./enhsp2.jar -o gripper2.pddl -f gripper-prob2.pddl -planner sat-aibr
```

## LPG
---

The lpg planner is very straight forward, there is really not much work to do to use it. All you have to do is make sure the executable has execution permission. Just to make sure, you can run the code below in the lpg folder.
```bash
chmod +x lpg
```
After this you can go straight to using it. You can find a tutorial on how to use it in this link: [LPG User Instruction](/lpg/README.TXT "LPG Manual") 

You can try out this example:
```bash
./lpg -o domain.pddl -f problem.pddl -n 1
```
another example 
```bash
./lpg -o temporal-elevators.pddl -f elevators-problem.pddl -n 1
```

## Metric FF
---
As state earlier, **_Metric-FF does not support durative-action_** it only works well for classical planning and numeric planning. It is thesame routine as lpg, check to see if the executable has execution permission and test some example with the executable called **ff**.

Examples

Classical Planning problem
```bash 
./ff -o gripper2.pddl -f gripper-prob2.pddl -s 1
```

Numeric Planning problem
```bash
./ff -o domain.pddl -f problem.pddl -s 1
```

Temporal Planning problem: _this is not going to work, it's going to give an error about **durative-action**_
```bash
./ff -o temporal-elevators.pddl -f elevators-problem.pddl -s 1
```




