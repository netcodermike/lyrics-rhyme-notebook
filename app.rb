require 'json'
require 'optparse'
def suffix(text)
 word=text.downcase.scan(/[a-z]+/).last.to_s
 word.sub(/e\z/,'')[-3,3] || word
end
def rhymes(rows,query)
 key=suffix(query);raise ArgumentError,'Supply a word or phrase' if key.empty?
 rows.select{|r|suffix(r.fetch('text'))==key}
end
options={file:'notebook.json'};OptionParser.new{|p|p.banner='Usage: ruby app.rb [--file notebook.json] add TEXT | rhyme WORD | list | demo | --self-test';p.on('--file PATH'){|v|options[:file]=v};p.on('--self-test'){options[:test]=true}}.parse!
if options[:test]
 raise 'suffix mismatch' unless suffix('A quiet night')==suffix('Distant light')
 raise 'false rhyme' unless rhymes([{'text'=>'A quiet night'},{'text'=>'A blue sea'}],'light').size==1
 begin;rhymes([],'');raise 'accepted empty';rescue ArgumentError;end
 puts 'Suffix normalization, rhyme filter and blank-query checks passed';exit
end
begin
 cmd=ARGV.shift;rows=File.exist?(options[:file]) ? JSON.parse(File.read(options[:file])) : []
 raise 'Notebook must contain an array of text entries' unless rows.is_a?(Array)&&rows.all?{|r|r.is_a?(Hash)&&r['text'].is_a?(String)}
 case cmd
 when 'add'
  text=ARGV.join(' ').strip;raise 'Text cannot be empty' if text.empty?;rows<<{'text'=>text,'tags'=>[]};temp=options[:file]+'.tmp';File.write(temp,JSON.pretty_generate(rows));File.rename(temp,options[:file]);puts 'Saved original fragment locally'
 when 'rhyme';puts JSON.pretty_generate(rhymes(rows,ARGV.join(' ')))
 when 'list';puts JSON.pretty_generate(rows)
 when 'demo';demo=[{'text'=>'Waves reflect the harbor light'},{'text'=>'We walk the coast into the night'},{'text'=>'A paper boat returns to sea'}];puts JSON.pretty_generate(rhymes(demo,'bright'))
 else;raise 'Choose add, rhyme, list or demo; --help for options'
 end
rescue StandardError=>e;warn e.message;exit 1;end
