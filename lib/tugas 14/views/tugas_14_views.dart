import 'package:belajar_flutter/tugas%2014/API/spell_api.dart';
import 'package:belajar_flutter/tugas%2014/models/models_14.dart';
import 'package:flutter/material.dart';

class Tugas14Views extends StatefulWidget {
  const Tugas14Views({super.key});

  @override
  State<Tugas14Views> createState() => _Tugas14ViewsState();
}

class _Tugas14ViewsState extends State<Tugas14Views> {
  final TextEditingController _searchController = TextEditingController();
  List<Karakter> _characters = [];
  List<Karakter> _filteredCharacters = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    final filter = _searchController.text.trim().toLowerCase();
    setState(() {
      if (filter.isEmpty) {
        _filteredCharacters = List.from(_characters);
      } else {
        _filteredCharacters =
            _characters.where((item) {
              final name = item.name?.toLowerCase() ?? '';
              final house = item.house?.toLowerCase() ?? '';
              final species = item.species?.toLowerCase() ?? '';
              final actor = item.actor?.toLowerCase() ?? '';
              return name.contains(filter) ||
                  house.contains(filter) ||
                  species.contains(filter) ||
                  actor.contains(filter);
            }).toList();
      }
    });
  }

  Future<void> _loadCharacters() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await getSpells();
      setState(() {
        _characters = result;
        _filteredCharacters = result;
        _isLoading = false;
      });
    } catch (_) {
      setState(() {
        _isLoading = false;
        _error = 'Tidak dapat memuat data. Periksa koneksi internet.';
      });
    }
  }

  void _openDetail(Karakter karakter) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                CharacterDetailPage(karakter: karakter),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation, instant transition
        },
      ),
    );
  }

  Widget _buildCharacterTile(Karakter char) {
    final house = char.house?.isNotEmpty == true ? char.house : 'Unknown';
    final actor = char.actor?.isNotEmpty == true ? char.actor : 'Unknown';

    return InkWell(
      onTap: () => _openDetail(char),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.deepPurple.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
                  char.image != null && char.image!.isNotEmpty
                      ? Image.network(
                        char.image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                      : Container(
                        width: 100,
                        height: 100,
                        color: Colors.white24,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                char.name ?? 'No Name',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'House: $house',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Actor: $actor',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        title: const Text(
          'Harry Potter Wildan Malaki',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.indigo.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cari nama wizard',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              if (_isLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              else if (_error != null)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _error!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _loadCharacters,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Muat ulang'),
                        ),
                      ],
                    ),
                  ),
                )
              else if (_filteredCharacters.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Karakter gak ditemukan',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              else
                Expanded(
                  child: RefreshIndicator(
                    color: Colors.white,
                    onRefresh: _loadCharacters,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      itemCount: _filteredCharacters.length,
                      itemBuilder: (context, index) {
                        final char = _filteredCharacters[index];
                        return _buildCharacterTile(char);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterDetailPage extends StatelessWidget {
  final Karakter karakter;

  const CharacterDetailPage({super.key, required this.karakter});

  Widget _infoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : 'Unknown',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wand = karakter.wand;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          karakter.name ?? 'Detail Karakter',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade800, Colors.indigo.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (karakter.image != null && karakter.image!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      karakter.image!,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.white70,
                    ),
                  ),
                const SizedBox(height: 16),
                Card(
                  color: Colors.white.withOpacity(0.15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          karakter.name ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _infoRow('House', karakter.house),
                        _infoRow('Species', karakter.species),
                        _infoRow('Gender', karakter.gender),
                        _infoRow('DOB', karakter.dateOfBirth),
                        _infoRow('Year', karakter.yearOfBirth?.toString()),
                        _infoRow('Ancestry', karakter.ancestry),
                        _infoRow('Eye Colour', karakter.eyeColour),
                        _infoRow('Hair Colour', karakter.hairColour),
                        _infoRow('Patronus', karakter.patronus),
                        _infoRow('Actor', karakter.actor),
                        _infoRow(
                          'Alive',
                          karakter.alive == null
                              ? 'Unknown'
                              : karakter.alive!
                              ? 'Yes'
                              : 'No',
                        ),
                        _infoRow(
                          'Student',
                          karakter.hogwartsStudent == null
                              ? 'Unknown'
                              : karakter.hogwartsStudent!
                              ? 'Yes'
                              : 'No',
                        ),
                        _infoRow(
                          'Staff',
                          karakter.hogwartsStaff == null
                              ? 'Unknown'
                              : karakter.hogwartsStaff!
                              ? 'Yes'
                              : 'No',
                        ),
                        const Divider(color: Colors.white30),
                        const Text(
                          'Wand',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          wand != null
                              ? 'Wood: ${wand.wood ?? '-'}\nCore: ${wand.core ?? '-'}\nLength: ${wand.length?.toString() ?? '-'}'
                              : 'Tidak tersedia',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if ((karakter.alternateNames?.isNotEmpty ?? false) ||
                            (karakter.alternateActors?.isNotEmpty ??
                                false)) ...[
                          const Divider(color: Colors.white30, height: 24),
                          if (karakter.alternateNames?.isNotEmpty ?? false) ...[
                            const Text(
                              'Alternate Names',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              karakter.alternateNames!.join(', '),
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                          if (karakter.alternateActors?.isNotEmpty ??
                              false) ...[
                            const SizedBox(height: 12),
                            const Text(
                              'Alternate Actors',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              karakter.alternateActors!.join(', '),
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
