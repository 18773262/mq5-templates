// MA stream v1.0

#ifndef MAStream_IMP
#define MAStream_IMP

class MAStream : public ABaseStream
{
   int _indi;
public:
   MAStream(string symbol, ENUM_TIMEFRAMES timeframe, int period, ENUM_MA_METHOD method, ENUM_APPLIED_PRICE price)
      :ABaseStream(symbol, timeframe)
   {
      _indi = iMA(symbol, timeframe, period, 0, method, price);
   }

   ~MAStream()
   {
      IndicatorRelease(_indi);
   }

   virtual bool GetSeriesValues(const int period, const int count, double &val[])
   {
      return CopyBuffer(_indi, 0, period, count, val) == count;
   }
};

#endif