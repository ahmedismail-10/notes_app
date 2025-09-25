import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class AddNoteColorsListView extends StatefulWidget {
  const AddNoteColorsListView({super.key});

  @override
  State<AddNoteColorsListView> createState() => _AddNoteColorsListViewState();
}

class _AddNoteColorsListViewState extends State<AddNoteColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 2 * 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).color =
                        kColors[index];
                  });
                },
                child: ColorItem(
                  selected: currentIndex == index,
                  color: kColors[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
