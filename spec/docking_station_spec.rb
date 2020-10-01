require 'docking_station'

describe DockingStation do
  it 'releases bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'raises error if release_bike called while no bikes docked' do
    expect { subject.release_bike }.to raise_error 'Error: no bikes docked.'
  end

  it 'raises error if .dock called when bike already docked' do
    station = DockingStation.new
    station.dock(Bike.new)
    expect { station.dock(Bike.new) }.to raise_error 'Error: bike already docked here.'
  end

  it 'docks bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it { is_expected.to respond_to(:bike)}

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
