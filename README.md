# NASA's Human Exploration Research Analog
During my time working as a Data Science Intern at the [SONIC Research Group](https://sonic.northwestern.edu/), I was captivated by the effect of Shared Mental Models (SMMs), or collective cognition in team functioning, on individual, team, and multiteam system (MTS) performances. In this research, I collected data across 2 campaigns and 9 missions from the National Aeronautics and Space Agency (NASA)’s [Human Exploration Research Analog (HERA)](https://www.nasa.gov/mission/hera/), where participants spent 45 days in isolated, confined habitats simulating an outer space mission. I the analyzed collected data from 25 sessions of a computer-based MTS decision-making lab experiment called Project RED (Red planet, Exploration, and Design), which was executed by the HERA crew working collaboratively with an offsite ground-support crew, forming a 4-team 12-person MTS. This study utilizes **contextualized performances**, which are team-level performances measured as a combination of their contribution to team (ToT) or multiteam system (MoT) oriented goals with multi-objective optimization. 

In short, this research follows a three-step approach:
1. I calculated the Euclidean distance between designated survey responses to measure the strength of team-related and task-related shared cognition.
2. I generated binary network ties of within-team and between-team shared cognition and performed descriptive analysis.
3. I fine-tuned and interpreted ALAAM models to investigate how the cognitive network in complex MTS influences contextualized performances.

Special thanks to Megan Chan and Dr. Noshir Contractor for their guidance and research assistance, Dr. Leslie DeChurch and Dr. Alina Lungeanu for their leading discoveries in shared team cognition, and NASA HERA for providing the classified data.

## Repository Descriptions

>[!NOTE]
>Since the research involves classified human data, this repository only contains code snippets that can be made available to the public.

### data:

Contains `.csv` files used in autologistic actor attribute models (ALAAMs).

### replication:

1. `data_preperation.ipynb`: used to obtain `.csv` files in `data`.
2. `alaam_analysis.R` used to replicate social network analysis.


