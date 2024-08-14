# Correlation-
Correlation using Systolic Array with Weight Stationary Architecture
We can decompose the correlation operation into the individual multiply and add calculations and perform each calculation on a separate PE.

Each element of the PE array (other than the leftmost) stores a weight value, multiplies it with its input and adds the result to the partial sum calculated by the previous element. 
After the second time step, one element of the output vector is computed every clock cycle, and one input element is read. We are obtaining maximum possible throughput at the minimum 
required bandwidth and taking advantage of all data reuse available. This design is an example of a “weight stationary” design, as the weights stay stationary and the inputs are streamed in.

![weight_stationary](https://github.com/user-attachments/assets/63a732df-b0d3-4c04-ac43-b8a54a777187)
