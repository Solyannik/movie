require 'film'

describe Film do
  let(:film) { Film.new("\"Смерть ей к лицу\"", 'Роберт Земекис', 1992) }

  describe '.new' do
    it 'initializes variables' do
      expect(film.title).to eq "\"Смерть ей к лицу\""
      expect(film.director).to eq 'Роберт Земекис'
      expect(film.year).to eq 1992
    end
  end

  describe '#director' do
    it 'return name director' do
      expect(film.director).to eq 'Роберт Земекис'
    end
  end

  describe '#to_s' do
    it 'returns correct string' do
      expect(film.to_s).to eq "Роберт Земекис - \"Смерть ей к лицу\" (1992 г.)"
    end
  end
end
