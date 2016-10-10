# violation SRP
class ViolativeAndroidUpdater
  def initialize(battery)
    @battery = battery
  end

  def update
    if enough_battery_percentage?
      puts "update android"
    else
      puts "battery insufficiently"
    end
  end

  private

  def enough_battery_percentage?
    @battery.percentage > 75
  end
end

class Battery
  attr_reader :percentage

  def initialize(percentage)
    @percentage = percentage
  end
end

# complies SRP
class AndroidUpdater
  def initialize(battery)
    @battery = battery
  end

  def update
    if BatteryUpdateInspector.new(@battery).enough?
      puts "update android"
    else
      puts "battery insufficiently"
    end
  end
end

class BatteryUpdateInspector
  def initialize(battery)
    @battery = battery
  end

  def enough?
    @battery.percentage > 75
  end
end
