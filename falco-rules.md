# Define Alert → Confidence Mapping
| Behavior  | Confidence   | 
|-------------- | -------------- | 
| Single shell exec    | Low     | 
| Repeated shell execs    | Medium     | 
| Shell + file access    | High     | 
| Shell + network + root    | Critical     | 

# Decide Response Level
| Confidence |	Action |
|-------------- | -------------- | 
|Low |	Log only |
| Medium |	Notify |
| High |	Page human |
| Critical	| Auto-response |

## Design the Decision Flow
Define a flow like:
- Incident detected
- Confidence evaluated
- Blast radius estimated
- Action selected
- Incident updated

## ALL Possible Isolation Techniques (Conceptual)

- Blocking outbound traffic
- Blocking inbound traffic
- Rate limiting requests
- Removing service from load balancer
- Scaling replicas to zero
- Moving pod to quarantine namespace
- Applying restrictive network rules

