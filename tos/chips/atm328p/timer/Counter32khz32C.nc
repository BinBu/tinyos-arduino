#include <Atm328pTimerConfig.h>
configuration Counter32khz32C
{
  provides interface Counter<T32khz, uint32_t>;
}
implementation
{
  components Atm328pCounterTimer1C;

  components new TransformCounterC (
    T32khz, uint32_t,
    ATM328P_TIMER_1_PRECISION_TYPE, uint16_t, ATM328P_TIMER_1_32KHZ_DOWNSCALE,
    uint32_t) as Transform;
  Transform.CounterFrom -> Atm328pCounterTimer1C;

  Counter = Transform.Counter;
}
