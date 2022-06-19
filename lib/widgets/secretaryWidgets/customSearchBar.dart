import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Viewmodels/common_ViewModels/wiki_list_ViewModel.dart';

class CustomSearchBar extends StatefulWidget {
  final WikiListViewModel viewModel;
  const CustomSearchBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Search',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined, color: Colors.grey),
                    onPressed: () {
                      widget.viewModel.filteredlist(searchController.text);
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
