shared_examples_for 'list' do |param|
  describe '#ar_list_item' do
    context 'text' do
      let(:result) { subject.ar_list_item(text: 'London') }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq 'London' }
    end

    context 'material icon' do
      let(:result) { subject.ar_list_item(text: 'London', material_icon_name: 'star') }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq 'London' }
      it { expect(result[:materialIconName]).to eq 'star' }
    end

    context 'url' do
      let(:result) { subject.ar_list_item(text: 'London', preview_url: 'https://test.com/image') }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:imageURL]).to eq 'https://test.com/image' }
    end
  end

  describe '#mw_list_search_suggestion' do
    context 'text' do
      let(:result) { subject.ar_list_search_suggestion(id: '1', text: 'London', section_name: 'City') }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:text]).to eq 'London' }
      it { expect(result[:sectionName]).to eq 'City' }
    end
  end
end
